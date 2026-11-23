import LiveScripts.Shared
import LiveScripts.S_a048206894bbe5424d366172ad97e90753a97b87e6e4796a0f1c16dc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a048206894bbe5424d366172ad97e90753a97b87e6e4796a0f1c16dc.script [ctx] 10000]
