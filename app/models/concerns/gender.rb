module Gender extend ActiveSupport::Concern
  included do
    enum GENDER: {MALE: 1, FEMALE: 2}
    enum CATEGORY: {ADULT: 1, CHILD: 2, INFANT: 3}
  end
end