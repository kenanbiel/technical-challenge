# Technical Challenge

### Installation

This is tested in [Vagrant](https://www.vagrantup.com/) v2.2.3. This also requires port 8080 and 8443 to be open on host machine.
#### Prepare ELK Stack

```sh
$ git clone <repo-url>
$ cd elk
$ vagrant up
```
Note: Due to host machine's limitation, there's a high chance for a race-condition in installing the stack. If that happens, I highly suggest to do another highstate.
```sh
$ vagrant ssh
$ sudo salt-call state.highstate
$ exit
```

Fire up your favorite browser in your host machine: `http://localhost:8443`, and setup the logstash key.

#### Drupal Installation
```sh
$ cd ../drupal
$ vagrant up
```
Fire up your favorite browser in your host machine: `http://localhost:8080`.
To confirm logging is working for the Drupal application, please refresh Kibana.
