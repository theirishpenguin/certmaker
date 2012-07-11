# Certmaker: a gem to create and deploy SSL certificates to cloud platforms

### Installation
    gem install certmaker

### Before you start
This project is at an early stage. It is 100% usable for people who use Namecheap's Comodo PositiveSSL certs. It is particularly useful for those who then use those certs on Heroku - as this gem does the heavy lifting of combining intermediate certifiate chains as required by Heroku. If you use something other than this configuration then we'd love to extend the role of this gem so drop us a line and we can work together to try and remove the pain of getting SSL certs setup for your application. It really shouldn't be this difficult. The main motivation behind this gem is to make the process easy to repeat - so that the next time you want to setup an SSL cert you don't have to jump through the hoops of remembering what files to combine and in what order.

### Passphrase removal
This gem has been updated to reflect that the key initially generated does not contain a passphrase. So there is no need to remove any passphrase. Yay! No passwords in keys have become popular so that cloud servers can automatically restart your app without needing to supply a password. 

### Usage
The typical usage is to create a private key locally and a CSR

    certmaker create www.example.com

You then keep the private key safe and use the CSR to request an SSL cert from your SSL Certificate provider

For some platforms the cert you receive from your SSL Certificate provider is all you need to get going.

For other platforms (eg. heroku) you need to do a little more, such as combining the certifice and intermediate cert chain.

For Namecheap Comodo PositiveSSL certs with heroku you just save the SSL cert zip in SSL provider artifact directory (eg. ~/.certmaker/certs/www_example_com_ssl/2_ssl_provider_artifacts/zips ) and run the commands...

    certmaker unpack_namecheap www.example.com
    certmaker heroku_wizard www.example.com

... to do all that is necessary (currently we only can vouch for this process working with namecheap.com Comodo PositiveSSL certs as it all we have tested with). This will do the necessary transformations and then prompt you to upload the finished SSL cert to your heroku app.

We also provide the following commands

    certmaker unpack_namecheap www.example.com
    certmaker append_chain www.example.com
    certmaker check_chain www.example.com
    certmaker upload_to_heroku www.example.com

All your keys, certs and other details are stored under a .certmaker directory in your home directory. You need to have a little understanding of the directory stucture to know where to find things. Each cert you generate will live in its own directory under .certmaker/certs/

For example...

    /home/user/.certmaker/
    `-- certs
      `-- www_example_com_ssl
          |-- 1_my_key_and_csr
          |   |-- www.example.com.csr
          |   `-- www.example.com.key
          |-- 2_ssl_provider_artifacts
          |   `-- zips
          |-- 3_key_and_cert_chained
          `-- config.yml

... your private key and CSR will be under 1_my_key_and_csr

Note: The first time you run a command such as 'certmaker create www.example.com' for a new subdomain you will be prompted to create a config.yml file under the individual cert directory. Currently this config file is only used to supply the 'ordered_chain_filenames' setting. This allows you to define the order in which intermediate certs are chained together (yes, this all does sound unnecessarily confusing!).

The 2_ssl_provider_artifacts directory is used to store the cert and other bits send on by your SSL certificate provider after you have successfully applied for a cert (zip files should be stored in the zips folder).

The 3_key_cert_and_cert_chained directory contains the final version of the cert by adding the intermediate chain. So by this stage we should have our SSL cert. Phew!

###Issues
Please log any issues at https://github.com/theirishpenguin/certmaker/issues

###Credits
Thanks to the following resources which laid the the foundation for this gem
* [Generating and adding a cert to Heroku](http://blog.dynamic50.com/2011/02/15/ssl-on-wildcard-domains-on-heroku-using-godaddy/)
* [How to build the intermediate cert chain for a Comodo cert](http://ryan.mcgeary.org/2011/09/16/how-to-add-a-dnsimple-ssl-certificate-to-heroku/)
* [How to verify a certificate chain file](http://backreference.org/2010/03/06/check-certificate-chain-file/)
* [How to debug SSL](http://sysadvent.blogspot.com/2010/12/day-3-debugging-ssltls-with-openssl1.html)
* [Most common openssl commands](http://www.sslshopper.com/article-most-common-openssl-commands.html)
