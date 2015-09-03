RADAMANTH.JOOMLA-ANSIBLE
=========

This role provide a basic Joomla 3.4 installation on mysql  behind an Apache2 VirtualHost 

Requirements
------------

Ubuntu trusty


Role Variables
--------------
Thoses variables coumld be superseed.
Some must be ! 

I suggest you add radamanth.joomla-ansible as requirement for your playbook.
Then create a role 'myjoomla' depending on radamanth.joomla-ansible

In that role, create a vars directory and file and superseed what you want.

Then in your playbook, reference the myjoomla role and not the radamanth.joomla-ansible directly 

```YAML
---
# defaults file for joomla-ansible/
joomla_version: "3.4.3"
# Url to get the joomla distribution
joomla_dist_url: "https://github.com/joomla/joomla-cms/releases/download/{{joomla_version}}/Joomla_{{joomla_version}}-Stable-Full_Package.zip"

# When True , do a get_url from {{joomla_dist_url}} 
# When false, will do a file copy from role files/ directory 
joomla_deploy_from_web: true

# Fore reinstall - Beware it erase every previous data
joomla_force_reinstall: false


#  Shall we inject to sql file or not 
joomla_inject_sql: true
# You shoud template it to replace #__ by {{joomla_site_dbprefix:}}
joomla_inject_sql_files:
  - { path: "joomla.sql", name: "joomla.sql" }

# delete installation dir or not ? 
joomla_delete_installation_dir: true

# You should put your site name here
joomla_site_name: "joomla-site"
# Future system user taht will be owner of the site (see suphp)
joomla_site_owner: "joomla"
joomla_site_group: "joomla"

# Joomla unzip direcotry 
joomla_install_dir: "/opt/joomla/{{joomla_site_name}}"


# jommla root password for db and users creation Shoudl put something here :D
joomla_mysql_root_passwd: ""
# Joomla DB Admin UserName
joomla_mysql_admin_user : "joomla"
# Joomla DB Admin passwd
joomla_mysql_admin_passwd: "DontLetThisLikeThisYouFool!"
# Joomlad DB name
joomla_mysql_db_name: "joomla"


# Joomla instance web adress - You should change this :D
joomla_domain: "joomla.mycompany.com"
# A self signed certificat subject. (You could replace it by a real professional one later if you want)
joomla_self_signed_cert_subj: "/C=FR/ST=France/L=Toulouse/O=IT/CN={{joomla_domain}}"
# Mail adress set in the apache 2 VHOST for the admin mail
joomla_admin_mail: "YouVhostAdminMail@YourDomain.Com"

# Joomla Instance Title
joomla_site_title: "My Wonderfull Site"
# Joomla SEcret token
joomla_site_secret: "QQvFeKphGid7CKLy"
# Joomla Table prefix
joomla_site_dbprefix: "joomla_"


# This user will be inserted in your joomla database, so you better change passwd
joomla_admin_login: "admin"
joomla_admin_passwd: "admin123"

```

Dependencies
------------


  - { role: 'radamanth.php5-ansible', version: '1.0.0'  }
  - { role: 'radamanth.mysql-ansible', version: '1.0.4'  }  
  - { role: 'kosssi.composer' , version: 'v1.4.0' }

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: radamanth.joomla-ansible }

License
-------

GPLV2

Author Information
------------------

Tony Deboschere
www.neovia.fr
Ansible Lover.
