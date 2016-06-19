class SearchFlight::Vna::OptionBuilder
  def initialize(uri, params)
    @uri = uri
    @params = params
  end

  def url
    url = String.new(@uri)
    url << '/SSW2010/B3QE/webqtrip.html?searchType=NORMAL'
    url << '&journeySpan=' << get_round_type(@params.round_type)
    url << '&origin=' << @params.ori_code
    url << '&destination=' << @params.des_code
    url << '&departureDate=' << format_date(@params.depart_date)
    if Order::OrderRoundType.is_round_trip(@params.round_type)
      url << '&returnDate=' << format_date(@params.return_date)
    end
    url << '&numAdults=' << @params.adult
    url << '&numChildren=' << @params.child
    url << '&numInfants=' << @params.infant
    url << '&alternativeLandingPage=true&promoCode=&lang=vi_VN'
    url
  end

  private
    def get_round_type(round_type)
      Order::OrderRoundType.is_round_trip(round_type) ? 'RT' : 'OW'
    end
    def format_date(date)
      DateFormatter.format_with_user_defined(date, '%Y-%m-%d')
    end
end
