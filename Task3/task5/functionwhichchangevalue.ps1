function Replace($url,$presentValue,$theChangedValue)
{
    $url = $url.Replace($presentValue, $theChangedValue)
    return $url
}