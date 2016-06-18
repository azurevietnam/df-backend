class SearchFlight::Vje::OptionBuilder
  def initialize(uri, params)
    @uri = uri
    @params = params
  end

  def url
    url = String.new(@uri)
    url << '/ameliapost.aspx?lang=vi'
  end

  def options_first
    if Order::OrderRoundType.is_round_trip(@params.round_type)
      body = {
            'txtPromoCode'      => '',
            'txtNumChildren'    => @params.child,
            'lstDepDateRange'   => '0',
            'txtNumInfants'     => @params.infant,
            'lstRetDateRange'   => '0',
            'lstLvlService'     => '1',
            'txtNumAdults'      => @params.adult,
            'dlstDepDate_Day'   => format_day(@params.depart_date),
            'dlstRetDate_Day'   => format_day(@params.return_date),
            'dlstDepDate_Month' => format_month(@params.depart_date),
            'dlstRetDate_Month' => format_month(@params.return_date),
            'lstDestAP'         => @params.des_code,
            'blnFares'          => 'False',
            'chkRoundTrip'      => get_round_type(@params.round_type),
            'lstOrigAP'         => @params.ori_code,
            'lstCurrency'       => 'VND',
            'lstResCurrency'    => 'VND'
      }
    else
        body = {
            'chkRoundTrip'      => get_round_type(@params.round_type),
            'txtPromoCode'      => '',
            'lstDepDateRange'   => '0',
            'txtNumChildren'    => @params.child,
            'txtNumInfants'     => @params.infant,
            'lstRetDateRange'   => '0',
            'txtNumAdults'      => @params.adult,
            'lstLvlService'     => '1',
            'dlstRetDate_Month' => format_month(@params.depart_date),
            'dlstDepDate_Month' => format_month(@params.depart_date),
            'dlstDepDate_Day'   => format_day(@params.depart_date),
            'dlstRetDate_Day'   => format_day(@params.depart_date),
            'blnFares'          => 'False',
            'lstDestAP'         => @params.des_code,
            'lstOrigAP'         => @params.ori_code,
            'lstCurrency'       => 'VND',
            'lstResCurrency'    => 'VND'
        }
    end
    options = {
        body: body,
        headers: {
                'Host' => 'book.vietjetair.com',
                'Accept-Encoding' => 'gzip, deflate',
                'Content-Type' => 'application/x-www-form-urlencoded'
                }
      }
    options
  end

  def options_second(previous_response)
    if Order::OrderRoundType.is_round_trip(@params.round_type)
      body = {
        'txtPromoCode'         => '',
        'SesID'                => '',
        '__VIEWSTATE'          => '/wEPDwULLTE1MzQ1MjI3MzAPZBYCZg9kFg4CCA8QZGQWAGQCCQ8QZGQWAGQCCw8QZGQWAGQCDQ8QZGQWAGQCEQ8QZGQWAGQCEg8QZGQWAGQCEw8QZGQWAGRk/SLp6eYBboDTdTTmIOra109LSis=',
        'lstDepDateRange'      => '0',
        'txtNumChildren'       => '0',
        'lstRetDateRange'      => '0',
        'txtNumAdults'         => '0',
        'txtNumInfants'        => '0',
        'lstLvlService'        => '1',
        'lstOrigAP'            => '-1',
        'lstDestAP'            => '-1',
        'dlstRetDate_Day'      => format_day(Date.today),
        'dlstDepDate_Day'      => format_day(Date.today),
        'dlstDepDate_Month'    => format_month(Date.today),
        'dlstRetDate_Month'    => format_month(Date.today),
        '__VIEWSTATEGENERATOR' => '35449566',
        'DebugID'              => '43',
        'lstCurrency'          => 'VND',
        'lstResCurrency'       => 'VND'
      }
    else
        body = {
            'txtPromoCode'         => '',
            'SesID'                => '',
            '__VIEWSTATE'          => '/wEPDwULLTE1MzQ1MjI3MzAPZBYCZg9kFg4CCA8QZGQWAGQCCQ8QZGQWAGQCCw8QZGQWAGQCDQ8QZGQWAGQCEQ8QZGQWAGQCEg8QZGQWAGQCEw8QZGQWAGRk/SLp6eYBboDTdTTmIOra109LSis=',
            'txtNumAdults'         => '0',
            'lstRetDateRange'      => '0',
            'txtNumChildren'       => '0',
            'txtNumInfants'        => '0',
            'lstDepDateRange'      => '0',
            'DebugID'              => '06',
            'lstLvlService'        => '1',
            'lstOrigAP'            => '-1',
            'lstDestAP'            => '-1',
            'dlstDepDate_Day'      => format_day(Date.today),
            'dlstRetDate_Day'      => format_day(Date.today),
            'dlstDepDate_Month'    => format_month(Date.today),
            'dlstRetDate_Month'    => format_month(Date.today),
            '__VIEWSTATEGENERATOR' => '35449566',
            'lstCurrency'          => 'VND',
            'lstResCurrency'       => 'VND'
        }
    end
    options = {
        body: body,
        headers: {
                'Accept-Encoding' => 'gzip, deflate',
                'Cookie' => previous_response.headers["set-cookie"],
                'Content-Type' => 'application/x-www-form-urlencoded'
            }
    }
    options
  end

  private
    def get_round_type(round_type)
      Order::OrderRoundType.is_round_trip(round_type) ? 'on' : ''
    end
    def format_day(date)
      DateFormatter.format_with_user_defined(date, '%d')
    end
    def format_date(date)
      DateFormatter.format_with_user_defined(date, '%d/%m/%Y')
    end
    def format_month(date)
      DateFormatter.format_with_user_defined(date, '%Y-%m')
    end
end
