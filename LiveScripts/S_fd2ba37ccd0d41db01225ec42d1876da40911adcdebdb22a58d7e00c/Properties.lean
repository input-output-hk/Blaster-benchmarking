import LiveScripts.Shared
import LiveScripts.S_fd2ba37ccd0d41db01225ec42d1876da40911adcdebdb22a58d7e00c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fd2ba37ccd0d41db01225ec42d1876da40911adcdebdb22a58d7e00c.script [ctx] 10000]
