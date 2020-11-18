# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| kana_first_name    | string              | null: false             |
| kana_last_name     | string              | null: false             |
| birthday           | date                | null: false             |

### Association

- has_many :items
- has_many :comments

## items table

| Column             | Type          | Options           |
|--------------------|---------------|-------------------|
| title              | string        | null: false       |
| text               | text          | null: false       |
| category_id        | integer       | null: false       |
| status_id          | integer       | null: false       |
| shipping_id        | integer       | null: false       |
| prefecture_id      | integer       | null: false       |
| day_id             | integer       | null: false       |
| price              | integer       | null: false       |
| user               | references    | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order
- has_one_attached :image

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## orders table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| card_number     | integer    | null: false       |
| deadline_month  | integer    | null: false       |
| deadline_year   | integer    | null: false       |
| security_number | integer    | null: false       |
| item            | references | foreign_key: true |
| address         | references | foreign_key: true |

### Association

- belongs_to :item
- has_one :address

## addresses table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| postal number     | integer    | null: false       |
| prefecture        | string     | null: false       |
| city              | string     | null: false       |
| street            | string     | null: false       |
| building_name     | string     |                   |
| telephone_number  | integer    | null: false       |

### Association

- belongs_to :order