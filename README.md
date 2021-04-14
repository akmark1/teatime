# TeaTime

カフェの情報や紅茶、名前通りティータイムの共有を目的としたアプリケーション

# 概要

この時間に追われる忙しい現代社会でお茶を飲んで一息入れる時間を大切にしてほしいと思い制作しました。<br>
誰かと繋がっている安心感を得るためにユーザーが自らの体験を投稿できるようにしています。<br>
また、コメント機能でユーザー同士がコミュニケーションを行えるように設計しました。

# 説明

# 使用言語

- Ruby
- Ruby on Rails
- Javascript
- HTML/CSS

# トップページ

[![Image from Gyazo](https://i.gyazo.com/62a1cb94171d13d5b710845e6873dc60.gif)](https://gyazo.com/62a1cb94171d13d5b710845e6873dc60)

# ユーザー新規登録画面

[![Image from Gyazo](https://i.gyazo.com/00ba19fd42fe26f04aab468265b4ba01.jpg)](https://gyazo.com/00ba19fd42fe26f04aab468265b4ba01)

# 投稿ページ

<[![Image from Gyazo](https://i.gyazo.com/c01a551cb99acb7a4fbf3633084483ff.jpg)](https://gyazo.com/c01a551cb99acb7a4fbf3633084483ff)

# 投稿一覧

[![Image from Gyazo](https://i.gyazo.com/b51ed8de86ac9b544952c453b2610147.gif)](https://gyazo.com/b51ed8de86ac9b544952c453b2610147)

# 投稿詳細ページ

[![Image from Gyazo](https://i.gyazo.com/54b1a1903901938b88ff809f1dc8d419.gif)](https://gyazo.com/54b1a1903901938b88ff809f1dc8d419)

# App URL

https://teatime-34843.herokuapp.com/

# テスト用アカウント

- email:test@test
- password:111aaa

# 利用方法

- トップページから右上の「三」をクリック
- SIGN UPをクリック
- nickname,email,passwordを入力
- トップページに偏移
- 再度「三」をクリックしPOSTをクリック
- 画像,名前,説明,URLを入力しSENDをクリック

## 投稿詳細ページ

- トップページを下にスクロールすると投稿一覧が表示されるので投稿をクリックすると詳細ページに偏移
- 投稿者は詳細ページから投稿の削除,編集が可能
- 全てのユーザーはコメントが可能

# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false unique:true |
| encrypted_password | string | null: false             |

### Association

- has_many : items
- has_many : comments

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| url              | text       | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_many : comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item