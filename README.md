Description
===========

Install perforce with a config file sourced in the user's shell profile.

Requirements
============

Chef 10

Attributes
==========

* owner - System user in who's home directory the configs will be stored. File permissions use this user as well.
* group - System group of the owner above.
* port  - Perforce server (eg. perforce-server:1666)
* user  - Perforce user. Defaults to owner.
* password - Perforce password.
* diff
* editor
* merge
* client
* charset
* commandcharset
* language
* host

Usage
=====

Include the recipe and set the attributes above as node or environment attributes

    include_recipe 'perforce'

LICENSE AND AUTHOR
==================

Author:: Josiah Kiehl (<jkiehl@riotgames.com>)
Author:: Kyle Allan (<kallan@riotgames.com>)

Copyright 2012-2013, Riot Games

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
