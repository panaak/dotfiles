(fset 'duplicate-and-comment-line
   "\C-@\C-[OB\C-[w\C-y\C-[OA\C-[OA\C-x/\C-[OB")

(fset 'comment-flip-flop
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("h/[1;5Bh/[1;5A" 0 "%d")) arg)))

(fset 'comment-uncomment-paragraph
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("h/" 0 "%d")) arg)))
