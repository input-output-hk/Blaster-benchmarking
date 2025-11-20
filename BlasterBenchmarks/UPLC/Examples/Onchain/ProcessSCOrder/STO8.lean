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
-- TODO: complete proof
theorem sto8 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    isSellSCOrder x →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ prop_compiledProcessSCOrder x) = some s →
    validSellSC x s := by sorry
    -- intro x s;
    -- blaster (only-optimize: 1)
    -- by_cases x.state.crN_SC = 0 <;>
    -- by_cases x.state.crN_RC = 0
    -- . blaster
    -- . blaster
    -- . blaster (only-optimize: 1); intros; repeat' constructor
    --   . sorry
    --   . by_cases x.orderRate < mkRatio x.state.crReserve x.state.crN_SC
    --     . sorry
    --     . sorry
    --   . by_cases x.orderRate < mkRatio x.state.crReserve x.state.crN_SC <;> blaster
    --   . blaster
    --   . blaster (only-optimize: 1)
    --     by_cases x.orderRate < mkRatio x.state.crReserve x.state.crN_SC
    --     . let price := x.orderRate * x.scBaseFeeSSC
    --       let adaForOrder := x.adaAtOrderUtxo - x.minAdaTransfer
    --       let totalPrice := truncate $ fromInteger (-x.nbTokens) * price
    --       let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    --       by_cases fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio
    --       . by_cases 1 + opFees < x.scMinOperatorFee <;>
    --         by_cases 1 + opFees < x.scMaxOperatorFee
    --         . blaster
    --         . blaster
    --         . let totalPrice_code := -(truncate $ price * fromInteger x.nbTokens)
    --           let opFees_code := truncate $ fromInteger totalPrice_code * x.scOperatorFeeRatio
    --           by_cases fromInteger opFees_code < fromInteger totalPrice_code * x.scOperatorFeeRatio
    --           . by_cases opFees < adaForOrder
    --             . blaster
    --             . by_cases zeroRatio < price <;>
    --               by_cases price * x.scOperatorFeeRatio < zeroRatio <;>
    --               by_cases adaForOrder < x.scMinOperatorFee
    --               . blaster
    --               . blaster
    --               . blaster
    --               . let n' := truncate $ fromInteger adaForOrder * (unsafeRecip $ price * x.scOperatorFeeRatio)
    --                 let totalPrice' := truncate $ fromInteger (n' + 1) * price
    --                 let opFees' := truncate $ fromInteger totalPrice' * x.scOperatorFeeRatio
    --                 by_cases fromInteger opFees' < fromInteger totalPrice' * x.scOperatorFeeRatio
    --                 . by_cases 1 + opFees' < x.scMinOperatorFee <;>
    --                   by_cases 1 + opFees_code < x.scMinOperatorFee
    --                   . blaster (timeout: 5)
    --                   . by_cases opFees_code < adaForOrder <;>
    --                     by_cases 1 + opFees_code < x.scMaxOperatorFee
    --                     . blaster (timeout: 5)
    --                     . blaster (timeout: 5)
    --                     . sorry
    --                     . blaster (timeout: 5)
    --                   . blaster (timeout: 5)
    --                   . by_cases 1 + opFees_code < x.scMaxOperatorFee <;>
    --                     by_cases 1 + opFees' < x.scMaxOperatorFee
    --                     . sorry
    --                     . blaster (timeout: 5)
    --                     . blaster (timeout: 5)
    --                     . blaster (timeout: 5)
    --                 . sorry
    --               . blaster (timeout: 5)
    --               . blaster (timeout: 5)
    --               . blaster (timeout: 5)
    --               . blaster (timeout: 5)
    --           . blaster (timeout: 5)
    --         . sorry
    --       . sorry
    --     . sorry
    --   . by_cases x.orderRate < mkRatio x.state.crReserve x.state.crN_SC <;> blaster
    --   . blaster (only-optimize: 1)
    --     by_cases x.orderRate < mkRatio x.state.crReserve x.state.crN_SC
    --     . let totalPrice := truncate $ fromInteger (-x.nbTokens) * (x.orderRate * x.scBaseFeeSSC)
    --       let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    --       by_cases fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio
    --       . blaster
    --       . blaster (random-seed: 3)
    --     . let r_price := mkRatio x.state.crReserve x.state.crN_SC
    --       let totalPrice := truncate $ fromInteger (-x.nbTokens) * (r_price * x.scBaseFeeSSC)
    --       let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    --       by_cases fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio
    --       . blaster (random-seed: 2)
    --       . by_cases r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio <;> blaster
    -- . sorry

-- NOTE: Remove solver options once subgoal splitting is supported
#solve (timeout: 2) (solve-result: 2) [sto8]

end Tests.Uplc.Onchain.ProcessSCOrder
