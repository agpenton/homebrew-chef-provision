#
# Cookbook:: base
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright:: 2020, Asdrubal Gonzalez Penton
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
user = `whoami`
group = 'staff'
u_id = `id -u $(whoami)`
g_uid = 'id -g $(whoami)'

homebrew_tap 'homebrew/core' do
  action :tap
  ignore_failure :quiet
end

homebrew_tap 'homebrew/cask' do
  action :tap
  ignore_failure :quiet
end

%w(autoconf bash-completion doxygen gettext git iperf sqlite nmap ssh-copy-id pv wget wrk httpie zsh-completions mackup mas python awscli packer packer-completion neofetch ruby).each do |b|
     homebrew_package b do
       action :install
       ignore_failure :quiet
     end
   end

%w(dropbox the-unarchiver iterm2 spotify transmission firefox docker virtualbox skype slack vagrant terraform macvim visual-studio-code jetbrains-toolbox).each do |c|
  homebrew_cask c do
    action :install
    ignore_failure :quiet
  end
end

directory "/Users/#{user}/Library/Caches/Homebrew" do
  owner "#{user}"
  group "#{group}"
  mode '0775'
  action :delete
end
directory "/Users/#{user}/Library/Caches/Homebrew" do
  owner "#{user}"
  group "#{group}"
  mode '0775'
  action :create
end
