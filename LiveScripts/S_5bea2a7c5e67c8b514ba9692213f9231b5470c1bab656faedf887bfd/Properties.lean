import LiveScripts.Shared
import LiveScripts.S_5bea2a7c5e67c8b514ba9692213f9231b5470c1bab656faedf887bfd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5bea2a7c5e67c8b514ba9692213f9231b5470c1bab656faedf887bfd.script [ctx] 10000]
