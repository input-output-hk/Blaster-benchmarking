import LiveScripts.Shared
import LiveScripts.S_6cc106941c9a06c5d956a00aeb001746c6e60618df4275f018a35da7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6cc106941c9a06c5d956a00aeb001746c6e60618df4275f018a35da7.script [ctx] 10000]
