module test_multi_4_row;
    reg [3:0] a, b;  // 4-bit inputs a and b
    wire [7:0] pro;  // 8-bit product output
    
    // Instantiate the 4x4 row-bypassing multiplier
    multi_4_row uut (
        .a(a),
        .b(b),
        .pro(pro)
    );

    initial begin
        // Display header
        $display("------------------------------------------------");
        $display("|   a   |   b   | pro (bin) | pro (dec) | Expected |");
        $display("------------------------------------------------");

        // Original test cases
        test_case(4'b0000, 4'b0000, 0);   // Test Case 1: a = 0, b = 0 (Zero multiplication)
        test_case(4'b0001, 4'b0001, 1);   // Test Case 2: a = 1, b = 1 (One multiplication)
        test_case(4'b1010, 4'b0000, 0);   // Test Case 3: a = 10, b = 0 (Multiplying by zero)
        test_case(4'b0011, 4'b0011, 9);   // Test Case 4: a = 3, b = 3 (Simple multiplication)
        test_case(4'b1111, 4'b1111, 225); // Test Case 5: a = 15, b = 15 (Edge case - maximum)
        test_case(4'b1110, 4'b0001, 14);  // Test Case 6: a = 14, b = 1 (Edge case - one zero in multiplier)
        test_case(4'b1001, 4'b0110, 54);  // Test Case 7: a = 9, b = 6 (Symmetry check 1)
        test_case(4'b0110, 4'b1001, 54);  // Test Case 8: a = 6, b = 9 (Symmetry check 2)
        test_case(4'b1100, 4'b0101, 60);  // Test Case 9: a = 12, b = 5 (Bypass check - first row)
        test_case(4'b1110, 4'b0011, 42);  // Test Case 10: a = 14, b = 3 (Bypass check - middle row)

        // Additional test cases
        test_case(4'b1111, 4'b0010, 30);  // Test Case 11: a = 15, b = 2 (Bypass check - first and third rows)
        test_case(4'b1010, 4'b0101, 50);  // Test Case 12: a = 10, b = 5 (Alternate bits set in both operands)
        test_case(4'b0111, 4'b1000, 56);  // Test Case 13: a = 7, b = 8 (Bypass check - all but last row)
        test_case(4'b1000, 4'b0111, 56);  // Test Case 14: a = 8, b = 7 (Symmetry check with Test Case 13)
        test_case(4'b1101, 4'b0011, 39);  // Test Case 15: a = 13, b = 3 (Odd number multiplication)
        test_case(4'b0100, 4'b0100, 16);  // Test Case 16: a = 4, b = 4 (Power of 2 multiplication)
        test_case(4'b1011, 4'b0110, 66);  // Test Case 17: a = 11, b = 6 (Prime number multiplication)
        test_case(4'b0010, 4'b1110, 28);  // Test Case 18: a = 2, b = 14 (Bypass check - second row)
        test_case(4'b1111, 4'b1000, 120); // Test Case 19: a = 15, b = 8 (Bypass check - all but last row, with max a)
        test_case(4'b0101, 4'b1010, 50);  // Test Case 20: a = 5, b = 10 (Symmetry check with Test Case 12)

        // End the simulation
        $finish;
    end

    task test_case;
        input [3:0] a_in, b_in;
        input [7:0] expected;
        begin
            a = a_in; b = b_in;
            #10 $display("| %4b  | %4b  |  %8b  |   %3d    |   %3d    |", a, b, pro, pro, expected);
        end
    endtask
endmodule
