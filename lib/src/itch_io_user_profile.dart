/*
 * Copyright 2019 Kennedy Tochukwu Ekeoha
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
class UserProfile {
  final int id;
  final String username;
  final String displayName;
  final String url;
  final String coverUrl;
  final bool isGamer;
  final bool isDeveloper;
  final bool isPressUser;

  
  UserProfile.fromJson(Map<String, dynamic> json) :
    isDeveloper = json['developer'],
    id = json['id'],
    url = json['url'],
    coverUrl = json['cover_url'],
    isGamer = json['gamer'],
    username = json['username'],
    displayName = json['display_name'],
    isPressUser = json['press_user'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['developer'] = this.isDeveloper;
    data['id'] = this.id;
    data['url'] = this.url;
    data['cover_url'] = this.coverUrl;
    data['gamer'] = this.isGamer;
    data['username'] = this.username;
    data['display_name'] = this.displayName;
    data['press_user'] = this.isPressUser;
    return data;
  }
}