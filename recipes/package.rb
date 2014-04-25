# Encoding: UTF-8
#
# Cookbook Name:: xyznc
# Recipe:: package
#
# Copyright (C) 2014, Jonathan Hartman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform_family']
when 'debian'
  pkgs = %w(znc znc-dev znc-extra znc-webadmin)
when 'rhel'
  pkgs = %w(znc znc-extra)
when 'mad_os_x'
  pkgs = %w(znc)
when 'windows'
  # http://znc-msvc.irsoft.de/downloads/znc-2014-04-13-setup.exe?
  pkgs = nil
else
  fail(Chef::Exceptions::UnsupportedAction,
       "Cookbook does not support platform family #{node['platform_family']}")
end

pkgs.each { |p| package p }
