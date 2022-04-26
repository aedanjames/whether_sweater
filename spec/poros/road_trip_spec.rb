require 'rails_helper'

RSpec.describe 'Road Trip Poro' do 
  it '#initialize' do 
    data = {:route => {
      :formattedTime=> "01:45:23",
      :locations=>[{:dragPoint=>false,
        :displayLatLng=>{:lng=>-104.984856, :lat=>39.738453},
        :adminArea4=>"Denver County",
        :adminArea5=>"Denver",
        :postalCode=>"",
        :adminArea1=>"US",
        :adminArea3=>"CO",
        :type=>"s",
        :sideOfStreet=>"N",
        :geocodeQualityCode=>"A5XAX",
        :adminArea4Type=>"County",
        :linkId=>42409351,
        :street=>"",
        :adminArea5Type=>"City",
        :geocodeQuality=>"CITY",
        :adminArea1Type=>"Country",
        :adminArea3Type=>"State",
        :latLng=>{:lng=>-104.984853, :lat=>39.738453}},
       {:dragPoint=>false,
        :displayLatLng=>{:lng=>-104.610413, :lat=>38.265427},
        :adminArea4=>"Pueblo County",
        :adminArea5=>"Pueblo",
        :postalCode=>"",
        :adminArea1=>"US",
        :adminArea3=>"CO",
        :type=>"s",
        :sideOfStreet=>"N",
        :geocodeQualityCode=>"A5XAX",
        :adminArea4Type=>"County",
        :linkId=>57644123,
        :street=>"",
        :adminArea5Type=>"City",
        :geocodeQuality=>"CITY",
        :adminArea1Type=>"Country",
        :adminArea3Type=>"State",
        :latLng=>{:lng=>-104.610415, :lat=>38.265425}}]}}

    trip = RoadTrip.new(data)
    expect(trip).to be_a RoadTrip
    expect(trip.start_city).to eq("Denver, CO")
    expect(trip.end_city).to eq("Pueblo, CO")
    expect(trip.travel_time).to eq("01:45:23")
  end 
  it '#formatted_travel_time' do 
    data = {:route => {
      :formattedTime=> "01:45:23",
      :locations=>[{:dragPoint=>false,
        :displayLatLng=>{:lng=>-104.984856, :lat=>39.738453},
        :adminArea4=>"Denver County",
        :adminArea5=>"Denver",
        :postalCode=>"",
        :adminArea1=>"US",
        :adminArea3=>"CO",
        :type=>"s",
        :sideOfStreet=>"N",
        :geocodeQualityCode=>"A5XAX",
        :adminArea4Type=>"County",
        :linkId=>42409351,
        :street=>"",
        :adminArea5Type=>"City",
        :geocodeQuality=>"CITY",
        :adminArea1Type=>"Country",
        :adminArea3Type=>"State",
        :latLng=>{:lng=>-104.984853, :lat=>39.738453}},
       {:dragPoint=>false,
        :displayLatLng=>{:lng=>-104.610413, :lat=>38.265427},
        :adminArea4=>"Pueblo County",
        :adminArea5=>"Pueblo",
        :postalCode=>"",
        :adminArea1=>"US",
        :adminArea3=>"CO",
        :type=>"s",
        :sideOfStreet=>"N",
        :geocodeQualityCode=>"A5XAX",
        :adminArea4Type=>"County",
        :linkId=>57644123,
        :street=>"",
        :adminArea5Type=>"City",
        :geocodeQuality=>"CITY",
        :adminArea1Type=>"Country",
        :adminArea3Type=>"State",
        :latLng=>{:lng=>-104.610415, :lat=>38.265425}}]}}

    trip = RoadTrip.new(data)
    expect(trip.formatted_travel_time).to eq("01 hours, 45 minutes")
  end 

  it '#hours_to_arrival_index' do 
    data = {:route => {
      :formattedTime=> "01:45:23",
      :locations=>[{:dragPoint=>false,
        :displayLatLng=>{:lng=>-104.984856, :lat=>39.738453},
        :adminArea4=>"Denver County",
        :adminArea5=>"Denver",
        :postalCode=>"",
        :adminArea1=>"US",
        :adminArea3=>"CO",
        :type=>"s",
        :sideOfStreet=>"N",
        :geocodeQualityCode=>"A5XAX",
        :adminArea4Type=>"County",
        :linkId=>42409351,
        :street=>"",
        :adminArea5Type=>"City",
        :geocodeQuality=>"CITY",
        :adminArea1Type=>"Country",
        :adminArea3Type=>"State",
        :latLng=>{:lng=>-104.984853, :lat=>39.738453}},
       {:dragPoint=>false,
        :displayLatLng=>{:lng=>-104.610413, :lat=>38.265427},
        :adminArea4=>"Pueblo County",
        :adminArea5=>"Pueblo",
        :postalCode=>"",
        :adminArea1=>"US",
        :adminArea3=>"CO",
        :type=>"s",
        :sideOfStreet=>"N",
        :geocodeQualityCode=>"A5XAX",
        :adminArea4Type=>"County",
        :linkId=>57644123,
        :street=>"",
        :adminArea5Type=>"City",
        :geocodeQuality=>"CITY",
        :adminArea1Type=>"Country",
        :adminArea3Type=>"State",
        :latLng=>{:lng=>-104.610415, :lat=>38.265425}}]}}

    trip = RoadTrip.new(data)
    expect(trip.hours_to_arrival_index).to eq(1)
  end

  it '#hours_to_arrival_index rounded down' do 
    data = {:route => {
      :formattedTime=> "01:15:23",
      :locations=>[{:dragPoint=>false,
        :displayLatLng=>{:lng=>-104.984856, :lat=>39.738453},
        :adminArea4=>"Denver County",
        :adminArea5=>"Denver",
        :postalCode=>"",
        :adminArea1=>"US",
        :adminArea3=>"CO",
        :type=>"s",
        :sideOfStreet=>"N",
        :geocodeQualityCode=>"A5XAX",
        :adminArea4Type=>"County",
        :linkId=>42409351,
        :street=>"",
        :adminArea5Type=>"City",
        :geocodeQuality=>"CITY",
        :adminArea1Type=>"Country",
        :adminArea3Type=>"State",
        :latLng=>{:lng=>-104.984853, :lat=>39.738453}},
       {:dragPoint=>false,
        :displayLatLng=>{:lng=>-104.610413, :lat=>38.265427},
        :adminArea4=>"Pueblo County",
        :adminArea5=>"Pueblo",
        :postalCode=>"",
        :adminArea1=>"US",
        :adminArea3=>"CO",
        :type=>"s",
        :sideOfStreet=>"N",
        :geocodeQualityCode=>"A5XAX",
        :adminArea4Type=>"County",
        :linkId=>57644123,
        :street=>"",
        :adminArea5Type=>"City",
        :geocodeQuality=>"CITY",
        :adminArea1Type=>"Country",
        :adminArea3Type=>"State",
        :latLng=>{:lng=>-104.610415, :lat=>38.265425}}]}}

    trip = RoadTrip.new(data)
    expect(trip.hours_to_arrival_index).to eq(0)
  end
end 