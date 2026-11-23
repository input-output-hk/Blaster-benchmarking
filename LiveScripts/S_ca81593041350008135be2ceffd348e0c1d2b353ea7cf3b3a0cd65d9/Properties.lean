import LiveScripts.Shared
import LiveScripts.S_ca81593041350008135be2ceffd348e0c1d2b353ea7cf3b3a0cd65d9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ca81593041350008135be2ceffd348e0c1d2b353ea7cf3b3a0cd65d9.script [ctx] 10000]
