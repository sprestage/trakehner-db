module HorsesHelper
end

class FamilyNameTree

  def initialize(horse)
    @horse = horse

    @name_tree = Array.new( Array.new(6) { 'Unknown' } )

    build_name_tree
  end

  def child
    return @horse.name
  end

  def sire
    return @name_tree[1]
  end

  def dam
    return @name_tree[2]
  end

  def sires_sire
    return @name_tree[3]
  end

  def sires_dam
    return @name_tree[4]
  end

  def dams_sire
    return @name_tree[5]
  end

  def dams_dam
    return @name_tree[6]
  end

  def build_name_tree

    if @horse
      if @horse.sire
        @name_tree[1] = @horse.sire.name
        if @horse.sire.sire
          @name_tree[4] = @horse.sire.sire.name
        end
        if @horse.sire.dam
          @name_tree[3] = @horse.sire.sire.name
        end
      end
      if @horse.dam
          @name_tree[2] = @horse.sire.name
        if @horse.dam.sire
          @name_tree[5]= @horse.sire.sire.name
        end
        if @horse.dam.dam
          @name_tree[6] = @horse.sire.sire.name
        end
      end
    end

  end

end
