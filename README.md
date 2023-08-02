# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name_kanji         | string | null: false |
| name_kana          | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :contents
- has_many :purchases
- has_many :addresses

## contents テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -------------------------------|
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| text            | string     | null: false                    |
| category        | string     | null: false                    |
| delivery        | string     | null: false                    |
| region          | string     | null: false                    |
| number_of_days  | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase
- belongs_to :address

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| credit_code     | integer    | null: false                    |
| credit_limit    | integer    | null: false                    |
| credit_security | integer    | null: false                    |
| phone_number    | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :content
- belongs_to :address

## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post_code  | integer    | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :content
- belongs_to :purchase