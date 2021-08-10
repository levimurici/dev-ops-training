exec { 'apt-update': # Criando um alias
  command => '/usr/bin/apt-get update'
}

# Instalar pacotes
package { ['php7.2', 'php7.2-mysql']:
  require => Exec['apt-update'], # Precisa do 'apt-update' antes de instalar o pacote
  ensure => installed,
}

exec { 'run-php7':
  require => Package['php7.2'],
  command => '/usr/bin/php -S 0.0.0.0:8666 -t src & /vagrant/src &'
}
