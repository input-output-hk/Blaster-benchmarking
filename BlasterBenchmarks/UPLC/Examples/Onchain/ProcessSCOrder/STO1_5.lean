import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.ProcessSCOrder
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

-- Provable once subgoal splitting supported inherently in blaster
theorem sto1_to_5 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
  validOrderInput x →
  resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
  validReserve s :=
  by sorry


-- Example of subgoal splitting to reduce complexity at Smt solver level
theorem sto1_to_5_part1 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
  x.nbTokens > 0 →
  validOrderInput x →
  resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
  validReserve s :=
  by sorry

theorem sto1_to_5_part2 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
  x.nbTokens ≤ 0 →
  x.state.crN_SC = 0 →
  validOrderInput x →
  resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
  validReserve s :=
  by sorry

theorem sto1_to_5_part3 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees < x.scMinOperatorFee →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part4 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees < x.adaAtOrderUtxo - x.minAdaTransfer →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part5 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees ≥ x.adaAtOrderUtxo - x.minAdaTransfer →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part6 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees ≥ x.adaAtOrderUtxo - x.minAdaTransfer →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part7 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees ≥ x.scMaxOperatorFee →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part8 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees ≥ x.scMaxOperatorFee →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    zeroRatio ≥ x.orderRate * x.scBaseFeeSSC →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part10 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees < x.scMinOperatorFee →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part11 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    x.adaAtOrderUtxo - x.minAdaTransfer < opFees →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part12 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    validOrderInput x →
    x.adaAtOrderUtxo - x.minAdaTransfer ≥ opFees →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part13 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees ≥ x.scMinOperatorFee →
    opFees ≥ x.scMaxOperatorFee →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part14 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees ≥ x.scMinOperatorFee →
    opFees ≥ x.scMaxOperatorFee →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    x.adaAtOrderUtxo - x.minAdaTransfer ≥ x.scMaxOperatorFee →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry


theorem sto1_to_5_part15 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees < x.scMinOperatorFee →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry


theorem sto1_to_5_part16 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees < x.adaAtOrderUtxo - x.minAdaTransfer →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part17 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees ≥ x.adaAtOrderUtxo - x.minAdaTransfer →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry


theorem sto1_to_5_part18 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees ≥ x.adaAtOrderUtxo - x.minAdaTransfer →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part19 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees ≥ x.scMaxOperatorFee →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part20 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees ≥ x.scMaxOperatorFee →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part21 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees < x.scMinOperatorFee →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part22 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    opFees < x.adaAtOrderUtxo - x.minAdaTransfer →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part23 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    opFees ≥ x.adaAtOrderUtxo - x.minAdaTransfer →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part24 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    opFees ≥ x.adaAtOrderUtxo - x.minAdaTransfer →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part25 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees ≥ x.scMinOperatorFee →
    opFees ≥ x.scMaxOperatorFee →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part26 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := mkRatio x.state.crReserve x.state.crN_SC
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC = 0 →
    x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
    validOrderInput x →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    opFees ≥ x.scMinOperatorFee →
    opFees ≥ x.scMaxOperatorFee →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part27 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    validOrderInput x →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees < x.scMinOperatorFee →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part28 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    validOrderInput x →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees < x.adaAtOrderUtxo - x.minAdaTransfer →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part29 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees ≥ x.adaAtOrderUtxo - x.minAdaTransfer →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part30 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees ≥ x.adaAtOrderUtxo - x.minAdaTransfer →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part31 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    opFees < x.scMinOperatorFee →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part32 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part33 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    x.adaAtOrderUtxo - x.minAdaTransfer ≥ opFees →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part34 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    x.adaAtOrderUtxo - x.minAdaTransfer < opFees →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part35 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let totalPrice := -(truncate $ x.orderRate * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    x.orderRate * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    x.adaAtOrderUtxo - x.minAdaTransfer ≥ opFees →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part36 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    1 + opFees < x.scMinOperatorFee →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part37 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees < x.adaAtOrderUtxo - x.minAdaTransfer →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part38 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees ≥ x.adaAtOrderUtxo - x.minAdaTransfer →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry


theorem sto1_to_5_part39 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees < fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    1 + opFees ≥ x.scMinOperatorFee →
    1 + opFees < x.scMaxOperatorFee →
    opFees ≥ x.adaAtOrderUtxo - x.minAdaTransfer →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part40 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    opFees < x.scMinOperatorFee →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part41 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part42 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    opFees ≥ x.scMinOperatorFee →
    opFees < x.scMaxOperatorFee →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio ≥ zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part43 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    opFees ≥ x.scMinOperatorFee →
    opFees ≥ x.scMaxOperatorFee →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry

theorem sto1_to_5_part44 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    let r_price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
    let totalPrice := -(truncate $ r_price * x.scBaseFeeSSC * fromInteger x.nbTokens)
    let opFees := truncate $ fromInteger totalPrice * x.scOperatorFeeRatio
    x.nbTokens ≤ 0 →
    x.state.crN_SC ≠ 0 →
    x.state.crN_RC ≠ 0 →
    x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
    fromInteger opFees ≥ fromInteger totalPrice * x.scOperatorFeeRatio →
    validOrderInput x →
    opFees ≥ x.scMinOperatorFee →
    opFees ≥ x.scMaxOperatorFee →
    r_price * x.scBaseFeeSSC * x.scOperatorFeeRatio < zeroRatio →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validReserve s :=
    by sorry


end Tests.Uplc.Onchain.ProcessSCOrder
