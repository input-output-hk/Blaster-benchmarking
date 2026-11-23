import LiveScripts.Shared
import LiveScripts.S_08ae08c71a5816e231de9f20e8e6e6d02e12e46b11f9e24c9aa4f376.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_08ae08c71a5816e231de9f20e8e6e6d02e12e46b11f9e24c9aa4f376.script [ctx] 10000]
