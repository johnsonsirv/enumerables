require './lib/enumerable'

describe Enumerable do
  let(:result) { [] }
  let(:input_array) { [-6,-4,9,1] }
  let(:range_values) { (-2..2) }
  let(:unsupported_range_values) { (1.5..5) }
  let(:proc_block) {proc { |elem| elem.positive? }}
  # let(:block_with_result) { proc { |elem| result << elem if elem.negative? } }

  describe '#my_each' do
   context 'no block is given' do
     it 'should return an enumerable' do
       expect(input_array.my_each).to be_a(Enumerator)
     end
   end
   context 'when block is given' do
    it 'should call block once for each element in an array, passing element as paramater' do
      input_array.my_each{ |elem| result << elem if elem.negative? }
      expect(result).to eql([-6,-4])
    end
    it 'should call block once for each sequence in range, passing element as paramater' do
      range_values.my_each{ |elem| result << elem if elem.negative? }
      expect(result).to eql([-2,-1])
    end
    it 'should return array when called on array' do
      expect(input_array.my_each{ proc_block }).to eql(input_array)
    end
    it 'should return range when called on range' do
      expect(range_values.my_each{ proc_block }).to eql(range_values)
    end
   end
 end

 describe '#my_each_with_index' do
  context 'no block is given' do
    it 'should return an enumerable' do
      expect(input_array.my_each_with_index).to be_a(Enumerator)
    end
  end
  context 'when block is given' do
    it 'should call block once for each element in an array, passing element as paramater' do
      input_array.my_each_with_index{ |elem| result << elem if elem.odd? }
      expect(result).to eql([1,3])
    end
    it 'should return array when called on array' do
      expect(input_array.my_each_with_index{ proc_block }).to eql(input_array)
    end
  end
 end

 describe '#my_select' do
   context 'no block is given' do
    it 'should return an enumerable' do
      expect(input_array.my_select).to be_a(Enumerator)
    end
   end
   context 'when block is given' do
    it 'should return a new array of elements for which the block returns true when called on array' do
      expect(input_array.my_select{ |elem| elem.positive? }).to eql([9,1])
    end
    it 'should return a new array of elements for which the block returns true when called on range' do
      expect(range_values.my_select{ |elem| elem.positive? }).to eql([1,2])
    end
   end
 end

 describe '#my_all' do
   context 'when no block and no argument is given' do
     it 'should add implicit block which should return true when none of the collection items are false or nil (falsey)' do
       
     end
   end
   context 'when block is given' do
     
   end
   context 'when optional argument is given' do
     
   end
   context 'when block and optional argument is given' do
     it 'should ignore block and return whether argument `===` element for every collection member ' do
       expect(%w[ant bear cat].my_all?(Integer){ |elem| elem.length > 2 }).to be_falsy
     end
   end
 end
end #end enumerable