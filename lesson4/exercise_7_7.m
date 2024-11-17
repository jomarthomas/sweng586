% Function to evaluate implication
implication = @(p, q) ~p | q;

% Exercise 7.7: Insulin Pump System
fprintf('Exercise 7.7: Insulin Pump System\n');
fprintf('---------------------------------\n');
fprintf('a (Button Pressed) | b (Dose Administered) | c (Light On) | Req1 (a⇒b) | Req2 (b⇒~c) | Req3 ((a∧c)⇒b) | Req4 (b⇒c) | All True\n');
fprintf('---------------------------------------------------------------------------------------------------------------\n');

consistent = false;
for a = [true false]
    for b = [true false]
        for c = [true false]
            req1 = implication(a, b);        % Requirement 1: a ⇒ b
            req2 = implication(b, ~c);      % Requirement 2: b ⇒ ~c
            req3 = implication(a && c, b);  % Requirement 3: (a ∧ c) ⇒ b
            req4 = implication(b, c);       % Requirement 4: b ⇒ c
            all_true = req1 && req2 && req3 && req4; % All requirements must be true
            fprintf('%17s | %21s | %12s | %10s | %11s | %15s | %10s | %8s\n', ...
                bool2str(a), bool2str(b), bool2str(c), ...
                bool2str(req1), bool2str(req2), bool2str(req3), bool2str(req4), bool2str(all_true));
            if all_true
                consistent = true;
            end
        end
    end
end

if consistent
    fprintf('\nConclusion: The requirements for Exercise 7.7 are consistent.\n');
else
    fprintf('\nConclusion: The requirements for Exercise 7.7 are inconsistent.\n');
end

% Helper function to convert boolean to 'T' or 'F'
function str = bool2str(value)
    if value
        str = 'T';
    else
        str = 'F';
    end
end