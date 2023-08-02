# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| name_kanji         | string  | null: false |
| name_kana          | string  | null: false |
| birthday           | date    | null: false |

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
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

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
| user_id         | integer    | null: false, foreign_key: true |
| content_id      | integer    | null: false, foreign_key: true |
| address_id      | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :content
- belongs_to :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| user_id         | integer    | null: false, foreign_key: true |
| content_id      | integer    | null: false, foreign_key: true |
| purchase_id     | integer    | null: false, foreign_key: true |
| prefecture_id   | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :content
- belongs_to :purchase
- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to_active_hash :prefecture

## prefectures テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| id              | integer    | null: false                    |
| name            | integer    | null: false                    |

### Association

- include ActiveHash::Associations
- has_many :addresses