class Track < ActiveRecord::Base
  belongs_to :angel
  def self.from_gpx(t)
    #gpx=Nokogiri::XML(File.open("../../anjo.gpx").read)
    gpx=Nokogiri::XML t['datafile'].read
    m=GeoRuby::SimpleFeatures::MultiPoint.from_points(
      gpx.search('trkpt').map do |p|
        d=DateTime.parse(p.search('time').pop.text)
        GeoRuby::SimpleFeatures::Point.from_x_y_m(p.attributes['lon'].value.to_f,p.attributes['lat'].value.to_f,d.hour*3600+d.min*60+d.sec)
      end,4326,false,true
    )
    m.srid=4326

    t=Track.new
    t.the_geom=m.as_hex_ewkb
    t
  end
  def self.from_file(f)
    self.from_gpx(f)
  end
  def points
    @s=the_geom.to_s
    g=GeoRuby::SimpleFeatures::MultiPoint.from_hex_ewkb(@s)
    g.geometries.map{|p| [p.x,p.y,p.m.to_i]}.sort{|p,q| p[2]<=>q[2]}
  end
  def set_angel(a)
    angel=a
  end


end

