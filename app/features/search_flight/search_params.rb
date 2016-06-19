class SearchFlight::SearchParams
  attr_reader :ori_code, :des_code, :round_type, :depart_date, :return_date, :adult, :child, :infant

  def initialize(ori_code, des_code, round_type, depart_date, return_date, adult, child, infant)
    @ori_code     = ori_code
    @des_code     = des_code
    @round_type   = round_type
    @depart_date  = depart_date
    @return_date  = return_date
    @adult        = adult.to_s
    @child        = child.to_s
    @infant       = infant.to_s
  end
end
