import LiveScripts.Shared
import LiveScripts.S_6bb0851fa2bf40c6729c9d5df97a4201fdea2b3ae169ad5242bfe47a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6bb0851fa2bf40c6729c9d5df97a4201fdea2b3ae169ad5242bfe47a.script [datum, redeemer, ctx] 10000]
