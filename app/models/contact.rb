class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones

    def author
        "Lucas Alves"
    end

    def as_json(options={})
        super(
            root: true,
            methods: :author,
            include: { kind: { only: :description }}
        )
    end    
end
