# <tt>find(:first, *args)</tt>を便利に使うためのラッパー
# このメソッドには<tt>find(:first)</tt>メソッドと
# 同じ引数をすべて渡せる
def first(*args)
  if args.any?
    if args.first.kind_of?(Integer) || (loaded?&& !args.first.kind_of?(Hash))
      to_a.first(*args)
    else
      apply_finder_options(args.first).first
    end
  else
    find_first
  end
end
