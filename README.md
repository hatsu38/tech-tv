# YouTube Live の勉強会 API

- WebSite：https://www.tech-tv.site/

## デプロイ方法

- サーバー：heroku
- Heroku アプリ： https://dashboard.heroku.com/apps/tech-tv

```
$ heroku login
$ git push heroku master
```

## 環境変数を Heroku にセット

```
$ heroku config:set SENTRY_DSN=""
```

環境変数を確認

```
$ heroku config
```

## タスクの実行

- イベントの新規登録を行う
- Heroku で毎時 10 分に実行される

```
$ heroku run rails batch:save_event
```

bundle exec rails batch:save_event

- イベントに紐づいた動画の新規登録を行う
- Heroku で毎時 30 分に実行される

```
$ heroku run rails batch:save_movie
```

bundle exec rails batch:save_event_tag

- イベントとタグの紐付けを行う

```
$ heroku run rails batch:save_event_tag
```

bundle exec rails batch:save_event_tag_diff_days[1]

- イベントとタグの紐付けを行う。前日から新しいイベントのみ。

```
$ heroku run rails batch:save_event_tag_diff_days[1]
```

bundle exec rails -s sitemap:refresh

- sitemap の作成してサーチエンジンに sitemap を更新したことを通知

```
$ heroku run rails -s sitemap:refresh
```

## DB 接続情報を確認

```
$ heroku pg:credentials:url --app tech-tv-api
```

## 環境変数の追加

```
heroku config:set ENV_NAME=value
```

## Migrate

```
heroku run rails db:migrate
```

## Heroku Scheduler(バッチ)

- https://dashboard.heroku.com/apps/tech-tv/scheduler
- DB のバックアップ AM3:00
  ```
  heroku pg:backups:schedule DATABASE_URL --at '03:00 Asia/Tokyo' --app tech-tv
  ```
