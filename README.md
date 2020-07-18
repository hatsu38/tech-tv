# YouTube Liveの勉強会 API
- WebSite(仮)：https://connpass-tube.hatsu38.com/

## デプロイ方法
- サーバー：heroku
- Herokuアプリ： https://dashboard.heroku.com/apps/connpass-tube
```
$ heroku login
$ git push heroku master
```

## 環境変数をHerokuにセット
```
$ heroku config:set SENTRY_DSN=""
```

環境変数を確認
```
$ heroku config
```


## タスクの実行
- イベントの新規登録を行う
- Herokuで毎時10分に実行される
```
$ heroku run rails batch:save_event
```

bundle exec rails batch:save_event
- イベントに紐づいた動画の新規登録を行う
- Herokuで毎時30分に実行される
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
- sitemapの作成してサーチエンジンにsitemapを更新したことを通知
```
$ heroku run rails -s sitemap:refresh
```

## DB接続情報を確認
```
$ heroku pg:credentials:url --app connpass-tube-api
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
- https://dashboard.heroku.com/apps/connpass-tube/scheduler

