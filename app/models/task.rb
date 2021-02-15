class Task < ApplicationRecord
    has_many :tasks

    validate :title_length
    validate :startdate_validation  
    validate :finishdate_validation
    validate :date_validation


    def title_length
        if title.empty?
            errors[:base] << "タイトルを20文字以内で入力してください"
        end

        if title.length > 20
            errors[:base] << "タイトルは20文字以内で入力してください"
        end

    end

    def startdate_validation
        if startdate == nil
            errors[:base] << "開始日を入力してください"
        end
    end

    def finishdate_validation
        if finishdate == nil
            errors[:base] << "終了日を入力してください"
        end
    end

    def date_validation
        if startdate == nil || finishdate == nil
            return
        end

        if startdate > finishdate
            errors[:base] << "終了日は、開始日かそれ以降を指定してください"
        end
    end

end
