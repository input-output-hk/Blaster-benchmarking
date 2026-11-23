import LiveScripts.Shared
import LiveScripts.S_192d5b6bdd82535c8dd7af8ca6400beba8530ccb42930bb65f06b0c3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_192d5b6bdd82535c8dd7af8ca6400beba8530ccb42930bb65f06b0c3.script [ctx] 10000]
