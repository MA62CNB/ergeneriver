package 
{
    import RandomPlus.*;

    public class RandomPlus extends Object
    {
        private var _st:Number;
        private var _en:Number;
        private var _len:Number;
        private var _pos:Number;
        private var _numPos:Number;
        private var _myNums:Array;
        private var _randNums:Array;

        public function RandomPlus(param1:Number, param2:Number = 0)
        {
            this._st = param2;
            this._en = param1;
            if (param1 < param2)
            {
                this._st = param1;
                this._en = param2;
            }
            this._len = this._en - this._st + 1;
            this.shuffle();
            return;
        }// end function

        public function getNum() : Number
        {
            if (this._numPos == this._len)
            {
                this.shuffle();
            }
            var _loc_1:* = this._randNums[this._numPos];
            var _loc_2:String = this;
            _loc_2._numPos = this._numPos++;
            return _loc_1;
        }// end function

        private function shuffle() : void
        {
            var _loc_1:Number = NaN;
            this._numPos = 0;
            this._randNums = [];
            this._myNums = [];
            _loc_1 = 0;
            while (_loc_1++ < this._len)
            {
                
                this._myNums[_loc_1] = this._st + _loc_1;
            }
            _loc_1 = 0;
            while (this._myNums.length > 0)
            {
                
                this._pos = Math.round(Math.random() * this._myNums.length--);
                this._randNums[_loc_1] = this._myNums[this._pos];
                this._myNums.splice(this._pos, 1);
            }
            return;
        }// end function

        public function get len() : Number
        {
            return this._len;
        }// end function

    }
}
