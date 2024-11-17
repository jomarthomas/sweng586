% Function to evaluate implication
implication = @(p, q) ~p | q;

% Exercise 7.6: Wet Well Control System
fprintf('Exercise 7.6: Wet Well Control System\n');
fprintf('-------------------------------------\n');
fprintf('a (Valve Open) | b (Valve Closed) | c (Pump On) | d (Water >10m) | Req1 (c⇒a) | Req2 (b⇒~d) | Req3 (d⇒c) | All True\n');
fprintf('---------------------------------------------------------------------------------------------\n');

consistent = false;
for a = [true false]
    b = ~a; % b is the negation of a
    for c = [true false]
        for d = [true false]
            req1 = implication(c, a);  % Requirement 1: c ⇒ a
            req2 = implication(b, ~d); % Requirement 2: b ⇒ ~d
            req3 = implication(d, c);  % Requirement 3: d ⇒ c
            all_true = req1 && req2 && req3; % All requirements must be true
            fprintf('%14s | %15s | %11s | %15s | %10s | %11s | %10s | %8s\n', ...
                bool2str(a), bool2str(b), bool2str(c), bool2str(d), ...
                bool2str(req1), bool2str(req2), bool2str(req3), bool2str(all_true));
            if all_true
                consistent = true;
            end
        end
    end
end

if consistent
    fprintf('\nConclusion: The requirements for Exercise 7.6 are consistent.\n\n');
else
    fprintf('\nConclusion: The requirements for Exercise 7.6 are inconsistent.\n\n');
end

% Helper function to convert boolean to 'T' or 'F'
function str = bool2str(value)
    if value
        str = 'T';
    else
        str = 'F';
    end
end