# YouTube Liveの勉強会 API

## デプロイ方法
- サーバー：heroklu
- Herokuアプリ： https://dashboard.heroku.com/apps/connpass-tube-api
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

## DB接続情報を確認
```
$ heroku pg:credentials:url --app connpass-tube-api
```

## Heroku Scheduler(バッチ)
- https://dashboard.heroku.com/apps/connpass-tube-api/scheduler

