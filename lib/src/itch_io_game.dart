/*
 * Copyright 2019 Kennedy Tochukwu Ekeoha
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
 * WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

import 'itch_io_user.dart';

class Game {
  final int id;
  final String title;
  final String url;
  final String coverUrl;
  final UserInfo user;
  final int purchasesCount;
  final int downloadsCount;
  final int viewsCount;
  final bool pAndroid;
  final bool pLinux;
  final bool pOsx;
  final bool pWindows;
  final String createdAt;
  final bool published;
  final String publishedAt;
  final bool canBeBought;
  final bool inPressSystem;
  final bool hasDemo;
  final int minPrice;
  final String classification;
  final String shortText;
  final String type;

  Game.fromJson(Map<String, dynamic> json)
      : purchasesCount = json['purchases_count'],
        pOsx = json['p_osx'],
        id = json['id'],
        published = json['published'],
        publishedAt = json['published_at'],
        viewsCount = json['views_count'],
        url = json['url'],
        canBeBought = json['can_be_bought'],
        pAndroid = json['p_android'],
        pLinux = json['p_linux'],
        createdAt = json['created_at'],
        inPressSystem = json['in_press_system'],
        user = json['user'] != null
            ? new UserInfo.fromJson(json['user'])
            : null,
        hasDemo = json['has_demo'],
        downloadsCount = json['downloads_count'],
        title = json['title'],
        pWindows = json['p_windows'],
        coverUrl = json['cover_url'],
        minPrice = json['min_price'],
        classification = json['classification'],
        shortText = json['short_text'],
        type = json['type'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['purchases_count'] = purchasesCount;
    data['p_osx'] = pOsx;
    data['id'] = id;
    data['published'] = published;
    data['published_at'] = publishedAt;
    data['views_count'] = viewsCount;
    data['url'] = url;
    data['can_be_bought'] = canBeBought;
    data['p_android'] = pAndroid;
    data['p_linux'] = pLinux;
    data['created_at'] = createdAt;
    data['in_press_system'] = inPressSystem;
    if (user != null) {
      data['user'] = user.toJson();
    }
    data['has_demo'] = hasDemo;
    data['downloads_count'] = downloadsCount;
    data['title'] = title;
    data['p_windows'] = pWindows;
    data['cover_url'] = coverUrl;
    data['min_price'] = minPrice;
    data['classification'] = classification;
    data['short_text'] = shortText;
    data['type'] = type;
    return data;
  }
}
