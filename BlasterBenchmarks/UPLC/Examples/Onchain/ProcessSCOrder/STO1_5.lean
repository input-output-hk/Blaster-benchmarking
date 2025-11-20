import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.ProcessSCOrder
import BlasterBenchmarks.UPLC.PreProcess
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ProcessSCOrder
open Tests.Uplc.Onchain

set_option warn.sorry false
-- STO1: Non-Negative Djed Reserve (for successful orders)
-- STO2: Non-Negative N_SC
-- STO3: Non-Negative N_RC
-- STO4: Djed Reserve Backing Stablecoins
-- STO5: Djed Reserve Backing Reservecoins
theorem sto1_to_5 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
  validOrderInput x →
  resultToComputeReserve (fromHaltState $ prop_compiledProcessSCOrder x) = some s →
  validReserve s := by sorry
  -- intro x s
  -- blaster (only-optimize: 1)
  -- by_cases x.nbTokens > 0
  -- . blaster
  -- . by_cases x.state.crN_SC = 0 <;>
  --   by_cases x.state.crN_RC = 0
  --   . blaster
  --   . blaster
  --   . by_cases x.orderRate < mkRatio x.state.crReserve x.state.crN_SC
  --     . let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
  --       let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
  --       by_cases fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio
  --       . by_cases 1 + opFees < x.scMinOperatorFee <;>
  --         by_cases 1 + opFees < x.scMaxOperatorFee
  --         . blaster
  --         . blaster
  --         . by_cases opFees < x.adaAtOrderUtxo - x.minAdaTransfer
  --           . blaster
  --           . by_cases x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster (random-seed: 3)
  --         . by_cases x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio
  --           . blaster
  --           . by_cases x.adaAtOrderUtxo - x.minAdaTransfer < x.scMaxOperatorFee
  --             . by_cases zeroRatio < x.orderRate * x.scBaseFeeSSC <;> blaster (random-seed: 14)
  --             . blaster
  --       . by_cases opFees < x.scMinOperatorFee <;>
  --         by_cases opFees < x.scMaxOperatorFee
  --         . blaster
  --         . blaster
  --         . by_cases x.adaAtOrderUtxo - x.minAdaTransfer < opFees
  --           . by_cases x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster (random-seed: 12)
  --           . blaster
  --         . by_cases x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio
  --           . blaster
  --           . by_cases x.adaAtOrderUtxo - x.minAdaTransfer < x.scMaxOperatorFee
  --             . by_cases zeroRatio < x.orderRate * x.scBaseFeeSSC <;> blaster (random-seed: 5)
  --             . blaster
  --     . let r_price := mkRatio x.state.crReserve x.state.crN_SC
  --       let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
  --       let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
  --       by_cases fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio
  --       . by_cases 1 + opFees < x.scMinOperatorFee <;>
  --         by_cases 1 + opFees < x.scMaxOperatorFee
  --         . blaster
  --         . blaster
  --         . by_cases opFees < x.adaAtOrderUtxo - x.minAdaTransfer
  --           . blaster
  --           . by_cases r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster
  --         . by_cases r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster
  --       . by_cases opFees < x.scMinOperatorFee <;>
  --         by_cases opFees < x.scMaxOperatorFee
  --         . blaster
  --         . blaster
  --         . by_cases opFees < x.adaAtOrderUtxo - x.minAdaTransfer
  --           . blaster
  --           . by_cases r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster (random-seed: 1)
  --         . by_cases r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster (random-seed: 1)
  --   . by_cases x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
  --     . let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
  --       let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
  --       by_cases fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio
  --       . by_cases 1 + opFees < x.scMinOperatorFee <;>
  --         by_cases 1 + opFees < x.scMaxOperatorFee
  --         . blaster
  --         . blaster
  --         . by_cases opFees < x.adaAtOrderUtxo - x.minAdaTransfer
  --           . blaster
  --           . by_cases x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster (random-seed: 6)
  --         . by_cases x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio
  --           . blaster
  --           . by_cases x.adaAtOrderUtxo - x.minAdaTransfer < x.scMaxOperatorFee <;> blaster (random-seed: 5)
  --       . by_cases opFees < x.scMinOperatorFee <;>
  --         by_cases opFees < x.scMaxOperatorFee <;>
  --         by_cases x.adaAtOrderUtxo - x.minAdaTransfer < opFees <;>
  --         by_cases x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster (random-seed: 4)
  --     . let r_price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
  --       let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
  --       let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
  --       by_cases fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio
  --       . by_cases 1 + opFees < x.scMinOperatorFee <;>
  --         by_cases 1 + opFees < x.scMaxOperatorFee
  --         . blaster
  --         . blaster
  --         . by_cases opFees < x.adaAtOrderUtxo - x.minAdaTransfer <;>
  --           by_cases r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster
  --         . by_cases opFees < x.adaAtOrderUtxo - x.minAdaTransfer <;>
  --           by_cases r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster (random-seed: 2)
  --       . by_cases opFees < x.scMinOperatorFee <;>
  --         by_cases opFees < x.scMaxOperatorFee
  --         . blaster
  --         . blaster
  --         . by_cases x.adaAtOrderUtxo - x.minAdaTransfer < opFees <;>
  --           by_cases r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster (random-seed: 9)
  --         . by_cases x.adaAtOrderUtxo - x.minAdaTransfer < opFees <;>
  --           by_cases r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster (random-seed: 7)


-- NOTE: Remove solver options once subgoal splitting is supported
#solve (timeout: 2) (solve-result: 2) [ sto1_to_5 ]


end Tests.Uplc.Onchain.ProcessSCOrder
