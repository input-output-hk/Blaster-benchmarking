import LiveScripts.Shared
import LiveScripts.S_5d90f454fa48293fbe77eef9b0a0a2901cb636d88b0e81651f4fdf0c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5d90f454fa48293fbe77eef9b0a0a2901cb636d88b0e81651f4fdf0c.script [ctx] 10000]
