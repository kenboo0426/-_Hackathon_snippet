class Post < ApplicationRecord
    belongs_to :user

    validates :user_id, {presence: true}
    validates :title, {presence: true, length:{maximum: 20}}
    validates :content, {presence: true, length:{maximum: 500}}

    def chnge_to_user
        ##PostモデルのインスタンスからUserモデルのインスタンスへ変換、使うかな？？
        ##@user = User.find_by(id: self.user_id)
    end
end
