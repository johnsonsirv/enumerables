require './lib/enumerable'

describe Enumerable do
  let(:result) { [] }
  let(:input_array) { [-6,-4,9,1] }
  let(:range_values) { (-2..2) }
  let(:unsupported_range_values) { (1.5..5) }
  let(:proc_block) { proc { input_array.my_each |elem| elem.negative? } }
 describe '#my_each' do
   context 'no block is given' do
     it 'should return an enumerable' do
       expect(input_array.my_each).to be_a(Enumerator)
     end
   end
   context 'when block is given' do
    it 'should call block once for each element in an array, passing element as paramater' do
        input_array.my_each{ |e| result << e if e.positive? }
        expect(result).to eql([9,1])
    end
    it 'should call block once for each element in an array, passing element as paramater' do
      range_values.my_each{ |e| result << e if e.negative? }
      expect(result).to eql([-2,-1])
  end
    it 'should return array when called on array' do
      expect(input_array.my_each{ proc_block }).to eql(input_array)
    end
    it 'should return range when called on range' do
      expect(range_values.my_each{ proc_block }).to eql(range_values)
    end
    it 'should raise TypeError if begin object of range does not support succ' do
      expect(unsupported_range_values.my_each{ proc_block }).to eql(range_values)
    end
   end
 end
end