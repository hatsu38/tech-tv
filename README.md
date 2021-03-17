# Tech-TV
- WebSite(仮)：https://www.tech-tv.site/

## Development

1. git clone git@github.com:hatsu38/tech-tv.git
2. cd tech-tv
3. bundle install
4. yarn install
5. bundle exec rails db:create
6. bundle exec rails db:migrate
7. foreman start -f Procifile.dev

Get Latest Event Script
```
bundle exec rails batch:save_event
```

### Versions
|Language/Framework |Version |
|:---|:---:|---:|
|Ruby |2.7.2|
|rails |6.0.3.4 |
|node| 14.15.1 |
|PostgreSQL | 12.3 |


## Heroku
### デプロイ方法
- サーバー：heroku
- Herokuアプリ： https://dashboard.heroku.com/apps/tech-tv
```
$ heroku login
$ git push heroku master
```

### 環境変数をHerokuにセット
```
$ heroku config:set SENTRY_DSN=""
```

環境変数を確認
```
$ heroku config
```


### タスクの実行
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

### DB接続情報を確認
```
$ heroku pg:credentials:url --app tech-tv-api
```

### 環境変数の追加
```
heroku config:set ENV_NAME=value
```

### Migrate
```
heroku run rails db:migrate
```

### Heroku Scheduler(バッチ)
- https://dashboard.heroku.com/apps/tech-tv/scheduler
- DBのバックアップ AM3:00
  ```
  heroku pg:backups:schedule DATABASE_URL --at '03:00 Asia/Tokyo' --app tech-tv
  ```
