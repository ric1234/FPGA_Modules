// alt_sld_fab_alt_sld_fab_host_link_jtag.v

// This file was auto-generated from altera_jtag_debug_link_internal_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module alt_sld_fab_alt_sld_fab_host_link_jtag #(
		parameter EXPORT_JTAG = 1
	) (
		input  wire       clk_clk,              //   clk.clk
		output wire       reset_reset,          // reset.reset
		output wire [7:0] h2t_channel,          //   h2t.channel
		input  wire       h2t_ready,            //      .ready
		output wire       h2t_valid,            //      .valid
		output wire [7:0] h2t_data,             //      .data
		output wire       h2t_startofpacket,    //      .startofpacket
		output wire       h2t_endofpacket,      //      .endofpacket
		output wire       t2h_ready,            //   t2h.ready
		input  wire       t2h_valid,            //      .valid
		input  wire [7:0] t2h_data,             //      .data
		input  wire [7:0] t2h_channel,          //      .channel
		input  wire       t2h_startofpacket,    //      .startofpacket
		input  wire       t2h_endofpacket,      //      .endofpacket
		output wire       mgmt_valid,           //  mgmt.valid
		output wire [7:0] mgmt_channel,         //      .channel
		output wire       mgmt_data,            //      .data
		input  wire       tck_clk,              //   tck.clk
		input  wire       node_tms,             //  node.tms
		input  wire       node_tdi,             //      .tdi
		output wire       node_tdo,             //      .tdo
		input  wire       node_ena,             //      .ena
		input  wire       node_usr1,            //      .usr1
		input  wire       node_clr,             //      .clr
		input  wire       node_clrn,            //      .clrn
		input  wire       node_jtag_state_tlr,  //      .jtag_state_tlr
		input  wire       node_jtag_state_rti,  //      .jtag_state_rti
		input  wire       node_jtag_state_sdrs, //      .jtag_state_sdrs
		input  wire       node_jtag_state_cdr,  //      .jtag_state_cdr
		input  wire       node_jtag_state_sdr,  //      .jtag_state_sdr
		input  wire       node_jtag_state_e1dr, //      .jtag_state_e1dr
		input  wire       node_jtag_state_pdr,  //      .jtag_state_pdr
		input  wire       node_jtag_state_e2dr, //      .jtag_state_e2dr
		input  wire       node_jtag_state_udr,  //      .jtag_state_udr
		input  wire       node_jtag_state_sirs, //      .jtag_state_sirs
		input  wire       node_jtag_state_cir,  //      .jtag_state_cir
		input  wire       node_jtag_state_sir,  //      .jtag_state_sir
		input  wire       node_jtag_state_e1ir, //      .jtag_state_e1ir
		input  wire       node_jtag_state_pir,  //      .jtag_state_pir
		input  wire       node_jtag_state_e2ir, //      .jtag_state_e2ir
		input  wire       node_jtag_state_uir,  //      .jtag_state_uir
		input  wire [2:0] node_ir_in,           //      .ir_in
		output wire       node_irq,             //      .irq
		output wire [2:0] node_ir_out           //      .ir_out
	);

	wire        jtag_src_valid;             // jtag:source_valid -> h2t_timing:in_valid
	wire  [7:0] jtag_src_data;              // jtag:source_data -> h2t_timing:in_data
	wire        h2t_timing_out_valid;       // h2t_timing:out_valid -> h2t_fifo:in_valid
	wire  [7:0] h2t_timing_out_data;        // h2t_timing:out_data -> h2t_fifo:in_data
	wire        h2t_timing_out_ready;       // h2t_fifo:in_ready -> h2t_timing:out_ready
	wire        h2t_fifo_out_valid;         // h2t_fifo:out_valid -> b2p:in_valid
	wire  [7:0] h2t_fifo_out_data;          // h2t_fifo:out_data -> b2p:in_data
	wire        h2t_fifo_out_ready;         // b2p:in_ready -> h2t_fifo:out_ready
	wire        p2b_out_bytes_stream_valid; // p2b:out_valid -> t2h_fifo:in_valid
	wire  [7:0] p2b_out_bytes_stream_data;  // p2b:out_data -> t2h_fifo:in_data
	wire        p2b_out_bytes_stream_ready; // t2h_fifo:in_ready -> p2b:out_ready
	wire        t2h_fifo_out_valid;         // t2h_fifo:out_valid -> jtag:sink_valid
	wire  [7:0] t2h_fifo_out_data;          // t2h_fifo:out_data -> jtag:sink_data
	wire        t2h_fifo_out_ready;         // jtag:sink_ready -> t2h_fifo:out_ready

	generate
		// If any of the display statements (or deliberately broken
		// instantiations) within this generate block triggers then this module
		// has been instantiated this module with a set of parameters different
		// from those it was generated for.  This will usually result in a
		// non-functioning system.
		if (EXPORT_JTAG != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					export_jtag_check ( .error(1'b1) );
		end
	endgenerate

	altera_avalon_st_jtag_interface #(
		.PURPOSE              (2),
		.UPSTREAM_FIFO_SIZE   (0),
		.DOWNSTREAM_FIFO_SIZE (6),
		.MGMT_CHANNEL_WIDTH   (8),
		.EXPORT_JTAG          (1),
		.USE_PLI              (0),
		.PLI_PORT             (50000)
	) jtag (
		.jtag_tck        (tck_clk),              //          tck.clk
		.jtag_tms        (node_tms),             //         node.tms
		.jtag_tdi        (node_tdi),             //             .tdi
		.jtag_tdo        (node_tdo),             //             .tdo
		.jtag_ena        (node_ena),             //             .ena
		.jtag_usr1       (node_usr1),            //             .usr1
		.jtag_clr        (node_clr),             //             .clr
		.jtag_clrn       (node_clrn),            //             .clrn
		.jtag_state_tlr  (node_jtag_state_tlr),  //             .jtag_state_tlr
		.jtag_state_rti  (node_jtag_state_rti),  //             .jtag_state_rti
		.jtag_state_sdrs (node_jtag_state_sdrs), //             .jtag_state_sdrs
		.jtag_state_cdr  (node_jtag_state_cdr),  //             .jtag_state_cdr
		.jtag_state_sdr  (node_jtag_state_sdr),  //             .jtag_state_sdr
		.jtag_state_e1dr (node_jtag_state_e1dr), //             .jtag_state_e1dr
		.jtag_state_pdr  (node_jtag_state_pdr),  //             .jtag_state_pdr
		.jtag_state_e2dr (node_jtag_state_e2dr), //             .jtag_state_e2dr
		.jtag_state_udr  (node_jtag_state_udr),  //             .jtag_state_udr
		.jtag_state_sirs (node_jtag_state_sirs), //             .jtag_state_sirs
		.jtag_state_cir  (node_jtag_state_cir),  //             .jtag_state_cir
		.jtag_state_sir  (node_jtag_state_sir),  //             .jtag_state_sir
		.jtag_state_e1ir (node_jtag_state_e1ir), //             .jtag_state_e1ir
		.jtag_state_pir  (node_jtag_state_pir),  //             .jtag_state_pir
		.jtag_state_e2ir (node_jtag_state_e2ir), //             .jtag_state_e2ir
		.jtag_state_uir  (node_jtag_state_uir),  //             .jtag_state_uir
		.jtag_ir_in      (node_ir_in),           //             .ir_in
		.jtag_irq        (node_irq),             //             .irq
		.jtag_ir_out     (node_ir_out),          //             .ir_out
		.clk             (clk_clk),              //        clock.clk
		.reset_n         (~reset_reset),         //  clock_reset.reset_n
		.source_data     (jtag_src_data),        //          src.data
		.source_valid    (jtag_src_valid),       //             .valid
		.sink_data       (t2h_fifo_out_data),    //         sink.data
		.sink_valid      (t2h_fifo_out_valid),   //             .valid
		.sink_ready      (t2h_fifo_out_ready),   //             .ready
		.resetrequest    (),                     // resetrequest.reset
		.mgmt_valid      (mgmt_valid),           //         mgmt.valid
		.mgmt_channel    (mgmt_channel),         //             .channel
		.mgmt_data       (mgmt_data),            //             .data
		.debug_reset     (reset_reset),          //  debug_reset.reset
		.source_ready    (1'b1)                  //  (terminated)
	);

	alt_sld_fab_alt_sld_fab_host_link_jtag_h2t_timing h2t_timing (
		.clk       (clk_clk),              //   clk.clk
		.reset_n   (~reset_reset),         // reset.reset_n
		.in_data   (jtag_src_data),        //    in.data
		.in_valid  (jtag_src_valid),       //      .valid
		.out_data  (h2t_timing_out_data),  //   out.data
		.out_valid (h2t_timing_out_valid), //      .valid
		.out_ready (h2t_timing_out_ready)  //      .ready
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (64),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (0),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) h2t_fifo (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (reset_reset),                          // clk_reset.reset
		.in_data           (h2t_timing_out_data),                  //        in.data
		.in_valid          (h2t_timing_out_valid),                 //          .valid
		.in_ready          (h2t_timing_out_ready),                 //          .ready
		.out_data          (h2t_fifo_out_data),                    //       out.data
		.out_valid         (h2t_fifo_out_valid),                   //          .valid
		.out_ready         (h2t_fifo_out_ready),                   //          .ready
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_startofpacket  (1'b0),                                 // (terminated)
		.in_endofpacket    (1'b0),                                 // (terminated)
		.out_startofpacket (),                                     // (terminated)
		.out_endofpacket   (),                                     // (terminated)
		.in_empty          (1'b0),                                 // (terminated)
		.out_empty         (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

	altera_avalon_st_bytes_to_packets #(
		.CHANNEL_WIDTH (8),
		.ENCODING      (1)
	) b2p (
		.clk               (clk_clk),            //                clk.clk
		.reset_n           (~reset_reset),       //          clk_reset.reset_n
		.out_channel       (h2t_channel),        // out_packets_stream.channel
		.out_ready         (h2t_ready),          //                   .ready
		.out_valid         (h2t_valid),          //                   .valid
		.out_data          (h2t_data),           //                   .data
		.out_startofpacket (h2t_startofpacket),  //                   .startofpacket
		.out_endofpacket   (h2t_endofpacket),    //                   .endofpacket
		.in_ready          (h2t_fifo_out_ready), //    in_bytes_stream.ready
		.in_valid          (h2t_fifo_out_valid), //                   .valid
		.in_data           (h2t_fifo_out_data)   //                   .data
	);

	altera_avalon_st_packets_to_bytes #(
		.CHANNEL_WIDTH (8),
		.ENCODING      (1)
	) p2b (
		.clk              (clk_clk),                    //               clk.clk
		.reset_n          (~reset_reset),               //         clk_reset.reset_n
		.in_ready         (t2h_ready),                  // in_packets_stream.ready
		.in_valid         (t2h_valid),                  //                  .valid
		.in_data          (t2h_data),                   //                  .data
		.in_channel       (t2h_channel),                //                  .channel
		.in_startofpacket (t2h_startofpacket),          //                  .startofpacket
		.in_endofpacket   (t2h_endofpacket),            //                  .endofpacket
		.out_ready        (p2b_out_bytes_stream_ready), //  out_bytes_stream.ready
		.out_valid        (p2b_out_bytes_stream_valid), //                  .valid
		.out_data         (p2b_out_bytes_stream_data)   //                  .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (64),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (0),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) t2h_fifo (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (reset_reset),                          // clk_reset.reset
		.in_data           (p2b_out_bytes_stream_data),            //        in.data
		.in_valid          (p2b_out_bytes_stream_valid),           //          .valid
		.in_ready          (p2b_out_bytes_stream_ready),           //          .ready
		.out_data          (t2h_fifo_out_data),                    //       out.data
		.out_valid         (t2h_fifo_out_valid),                   //          .valid
		.out_ready         (t2h_fifo_out_ready),                   //          .ready
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_startofpacket  (1'b0),                                 // (terminated)
		.in_endofpacket    (1'b0),                                 // (terminated)
		.out_startofpacket (),                                     // (terminated)
		.out_endofpacket   (),                                     // (terminated)
		.in_empty          (1'b0),                                 // (terminated)
		.out_empty         (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

endmodule
