import LiveScripts.Shared
import LiveScripts.S_e148d0b3f98a8385e07d3a49139563c6a30b613fde76ecf03994591d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e148d0b3f98a8385e07d3a49139563c6a30b613fde76ecf03994591d.script [datum, redeemer, ctx] 10000]
