import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.ProcessSCOrder
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ProcessSCOrder
open Tests.Uplc.Onchain

set_option warn.sorry false
-- STO45: Insufficient Operator’s Fees Violation for Selling Stablecoin Order
-- Provable once subgoal splitting supported inherently in blaster
theorem sto45 :
  ∀ (x : ProcessSCInput),
  isSellSCOrder x →
  validOrderInput x →
  isInsufficientOperatorFees (fromHaltState $ appliedProcessSCOrder x) →
  validInsufficientFeesForSellSC x := by sorry

-- Example of subgoal splitting to reduce complexity at Smt solver level
theorem sto45_part1 :
  ∀ (x : ProcessSCInput),
  isSellSCOrder x →
  validOrderInput x →
  x.state.crN_SC = 0 →
  isInsufficientOperatorFees (fromHaltState $ appliedProcessSCOrder x) →
  validInsufficientFeesForSellSC x := by sorry

theorem sto45_part2 :
  ∀ (x : ProcessSCInput),
  isSellSCOrder x →
  validOrderInput x →
  x.state.crN_SC ≠ 0 →
  x.state.crN_RC = 0 →
  x.orderRate < mkRatio x.state.crReserve x.state.crN_SC →
  isInsufficientOperatorFees (fromHaltState $ appliedProcessSCOrder x) →
  validInsufficientFeesForSellSC x := by sorry

theorem sto45_part3 :
  ∀ (x : ProcessSCInput),
  isSellSCOrder x →
  validOrderInput x →
  x.state.crN_SC ≠ 0 →
  x.state.crN_RC = 0 →
  x.orderRate ≥ mkRatio x.state.crReserve x.state.crN_SC →
  isInsufficientOperatorFees (fromHaltState $ appliedProcessSCOrder x) →
  validInsufficientFeesForSellSC x := by sorry

theorem sto45_part4 :
  ∀ (x : ProcessSCInput),
  isSellSCOrder x →
  validOrderInput x →
  x.state.crN_SC ≠ 0 →
  x.state.crN_RC ≠ 0 →
  x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
  isInsufficientOperatorFees (fromHaltState $ appliedProcessSCOrder x) →
  validInsufficientFeesForSellSC x := by sorry

theorem sto45_part5 :
  ∀ (x : ProcessSCInput),
  isSellSCOrder x →
  validOrderInput x →
  x.state.crN_SC ≠ 0 →
  x.state.crN_RC ≠ 0 →
  x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
  let price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
  let priceWithFees := (price * x.scBaseFeeSSC) * x.scOperatorFeeRatio
  fromInteger (truncate priceWithFees) < priceWithFees →
  isInsufficientOperatorFees (fromHaltState $ appliedProcessSCOrder x) →
  validInsufficientFeesForSellSC x := by sorry

theorem sto45_part6 :
  ∀ (x : ProcessSCInput),
  let price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
  let priceWithFees := (price * x.scBaseFeeSSC) * x.scOperatorFeeRatio
  fromInteger (truncate priceWithFees) ≥ priceWithFees →
  isSellSCOrder x →
  validOrderInput x →
  x.state.crN_SC ≠ 0 →
  x.state.crN_RC ≠ 0 →
  x.orderRate ≥ fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC) →
  isInsufficientOperatorFees (fromHaltState $ appliedProcessSCOrder x) →
  validInsufficientFeesForSellSC x := by sorry

end Tests.Uplc.Onchain.ProcessSCOrder
