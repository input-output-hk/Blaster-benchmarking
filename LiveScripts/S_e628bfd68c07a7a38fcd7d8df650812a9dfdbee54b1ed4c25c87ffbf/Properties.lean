import LiveScripts.Shared
import LiveScripts.S_e628bfd68c07a7a38fcd7d8df650812a9dfdbee54b1ed4c25c87ffbf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e628bfd68c07a7a38fcd7d8df650812a9dfdbee54b1ed4c25c87ffbf.script [datum, redeemer, ctx] 10000]
