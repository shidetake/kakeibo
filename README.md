# Kakeibo

個人用家計簿

## 使い方

MySQLが起動していること。
Homebrewを使ってインストールしている場合は、以下のコマンドで自動起動設定してしまうのが良い。
```bash
$ brew services start mysql
```

```
$ bundle install
```

もしmysql2のインストールがうまくいかない場合は以下のコマンドを実行してから再度`bundle install`する。

```bash
$ bundle config --local build.mysql2 "--with-ldflags=-L/opt/homebrew/Cellar/zstd/1.5.0/lib" "--with-opt-dir=/opt/homebrew/opt/openssl"
```

MySQLのユーザ名とパスワードを環境変数に設定

```bash
$ echo export RAILS_DATABASE_USER=root >> ~/.zshrc
$ echo export RAILS_DATABASE_PASSWORD=password >> ~/.zshrc
```

その後、データベースへのマイグレーションを実行します。

```
$ bundle exec rails db:create
$ bundle exec rails db:migrate
```

```
$ bundle exec rails server
```
