class Bowling
    def initialize(scores)
        @scores = scores
    end

    # ストライクとスペアを判別するメソッド
    def strike?(frame)
        frame.length == 1 && frame[0] == 10
    end

    def spare?(frame)
        frame.length == 2 && frame.sum == 10
    end


    # totalにスコアを加算するループ処理
    def result
        total = 0
        @scores.each.with_index do |frame, i|
            if strike?(frame)
                if i < 8
                    total += frame.sum + @scores[i+1].sum
                    if strike?(@scores[i+1])
                        total += @scores[i+2][0]
                    end
                else
                    total += frame.sum + @scores[i+1][0..1].sum
                end

            elsif spare?(frame)
                total += frame.sum + @scores[i+1][0]
            else
                total += frame.sum
            end
            
            puts total
        end
    end
    # ストライクの時に、現在の配列番号に+1した配列の合計(array.sum)を加算する
    # スペアの時は、現在の配列番号に+1した配列の0番目の数値を加算する。
end

# scores = [
    # [7, 3],
    # [9, 0],
    # [8, 1],
    # [10],
    # [5, 5],
    # [3, 3],
    # [10],
    # [10],
    # [5, 3],
    # [4, 6, 9]
# ]
# bowling = Bowling.new(scores)
# bowling.result
