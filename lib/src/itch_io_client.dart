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

import 'dart:convert';
import 'dart:core';

import 'itch_io_credentials_info.dart';
import 'itch_io_endpoints.dart';
import 'itch_io_errors.dart';
import 'itch_io_provider.dart';
import 'itch_io_user_games.dart';
import 'itch_io_user_profile.dart';

class Client {
  final String _apiKey;

  Client(this._apiKey);

  /// Returns information on the set of credentials
  /// used to make this API request.
  /// In particular, the response includes
  /// the list of scopes the credentials give access to,
  /// and if it’s a JWT token, the expiration date
  Future<CredentialsInfoResult> getCredentialsInfo() async {
    var endpoint = Endpoints.credentialsInfo(_apiKey);

    var data;
    try {
      data = await Provider.getData(Uri.parse(endpoint));
    } catch (ex) {
      // invalid json
      return CredentialsInfoResult(
          success: false,
          info: null,
          error: ItchioError(errors: [ItchioError.networkError]));
    }
    Map<String, dynamic> decodedData;

    try {
      decodedData = json.decode(data);
    } on FormatException catch (ex) {
      // invalid json
      return CredentialsInfoResult(
          success: false,
          info: null,
          error: ItchioError(errors: [ItchioError.invalidJson]));
    }

    try {
      var info = CredentialsInfo.fromJson(decodedData);
      return CredentialsInfoResult(success: true, info: info, error: null);
    } catch (e) {
      try {
        var err = ItchioError.fromJson(decodedData);
        return CredentialsInfoResult(
            success: false, info: null, error: err); // invalid key probably
      } catch (ex) {
        // it is json but it is neither a Credentials or
        // a Itchio Error... strange...
        return CredentialsInfoResult(
            success: false,
            info: null,
            error: ItchioError(errors: [ItchioError.unknown]));
      }
    }
  }

  /// Fetches public profile data for the user to which
  /// the API key belongs.
  Future<UserProfileResult> getUserProfile() async {
    var endpoint = Endpoints.userProfile(_apiKey);

    var data;
    try {
      data = await Provider.getData(Uri.parse(endpoint));
    } catch (ex) {
      // invalid json
      return UserProfileResult(
          success: false,
          user: null,
          error: ItchioError(errors: [ItchioError.networkError]));
    }
    Map<String, dynamic> decodedData;

    try {
      decodedData = json.decode(data);
    } on FormatException catch (ex) {
      // invalid json
      return UserProfileResult(
          success: false,
          user: null,
          error: ItchioError(errors: [ItchioError.invalidJson]));
    }

    try {
      var user = UserProfile.fromJson(decodedData);
      return UserProfileResult(success: true, user: user, error: null);
    } catch (e) {
      try {
        var err = ItchioError.fromJson(decodedData);
        return UserProfileResult(success: false, user: null, error: err);
      } catch (ex) {
        // it is json but it is neither an object or
        // a Itchio Error... strange...
        return UserProfileResult(
            success: false,
            user: null,
            error: ItchioError(errors: [ItchioError.unknown]));
      }
    }
  }

  /// Fetches data about all the games you've uploaded or
  /// have edit access to.
  Future<UserGamesResult> getUserGames() async {
    var endpoint = Endpoints.userGames(_apiKey);

    var data;
    try {
      data = await Provider.getData(Uri.parse(endpoint));
    } catch (ex) {
      // invalid json
      return UserGamesResult(
          success: false,
          games: null,
          error: ItchioError(errors: [ItchioError.networkError]));
    }
    Map<String, dynamic> decodedData;

    try {
      decodedData = json.decode(data);
    } on FormatException catch (ex) {
      // invalid json
      return UserGamesResult(
          success: false,
          games: null,
          error: ItchioError(errors: [ItchioError.invalidJson]));
    }

    try {
      var games = UserGames.fromJson(decodedData);
      return UserGamesResult(success: true, games: games, error: null);
    } catch (e) {
      try {
        var err = ItchioError.fromJson(decodedData);
        return UserGamesResult(success: false, games: null, error: err);
      } catch (ex) {
        // it is json but it is neither an object or
        // a Itchio Error... strange...
        return UserGamesResult(
            success: false,
            games: null,
            error: ItchioError(errors: [ItchioError.unknown]));
      }
    }
  }
}
